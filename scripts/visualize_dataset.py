#!/usr/bin/env python3
# @file      visualize_dataset.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

import glob
import os
import subprocess
import time
from datetime import datetime

import click
import matplotlib.pyplot as plt
import numpy as np
import open3d as o3d
from tqdm import trange

# Global parameters for the visualizer
CAMERA_PATTERN = 'ScreenCamera_'
RENDER_PATTERN = 'RenderOption_'
tmp_dir = '/tmp/render_files/'


def sendmessage(msg):
    print(' >>>', msg, ' <<<')
    subprocess.Popen(['notify-send', msg])


def get_filename(path, idx):
    filenames = sorted(glob.glob(path + '*.ply'))
    return int(filenames[idx].split('.')[0].split('/')[-1])


def last_file(path):
    return get_filename(path, -1)


def first_file(path):
    return get_filename(path, 0)


def get_car_model(filename):
    mesh = o3d.io.read_triangle_mesh(filename)
    mesh.compute_triangle_normals()
    mesh.compute_vertex_normals()
    return mesh


def update_visualizer(vis, camera, geometries):
    vis.clear_geometries()
    for geometry in geometries:
        vis.add_geometry(geometry)
    vis.update_renderer()
    ctr = vis.get_view_control()
    ctr.convert_from_pinhole_camera_parameters(camera)
    vis.poll_events()


def set_background_color(vis, black):
    if black:
        vis.get_render_option().background_color = np.asarray([0., 0., 0.])
    else:
        vis.get_render_option().background_color = np.asarray([1., 1., 1.])


def get_latest_json(pattern):
    """Helper to collect the .json files generated by the renderer."""
    json_files = glob.glob(os.path.join(tmp_dir, pattern + '*'))

    if not json_files:
        return None

    return max(json_files, key=os.path.getctime)


def load_latest_viewpoint(vis):
    """Loads the latest camera viewpoint and render options from the tmp_dir."""
    option_file = get_latest_json(RENDER_PATTERN)
    camera_file = get_latest_json(CAMERA_PATTERN)

    if not option_file and not camera_file:
        print("[WARNING] No viewpoint/options available, using defaults")
        camera = o3d.camera.PinholeCameraParameters()
    else:
        camera = o3d.io.read_pinhole_camera_parameters(camera_file)
        opt = vis.get_render_option()
        opt.load_from_json(option_file)

    return camera


def collect_options_and_camera_position(vis):
    """Collect the current camera position and render options form the vis."""
    # Get current timestamp and Imitate Visualizer naming convention
    timestamp = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    option_file = os.path.join(tmp_dir, RENDER_PATTERN + timestamp + '.json')
    camera_file = os.path.join(tmp_dir, CAMERA_PATTERN + timestamp + '.json')

    opt = vis.get_render_option()
    opt.save_to_json(option_file)

    ctr = vis.get_view_control()
    camera = ctr.convert_to_pinhole_camera_parameters()
    o3d.io.write_pinhole_camera_parameters(camera_file, camera)

    return camera


@click.command()
@click.argument('dataset',
                type=click.Path(exists=True),
                required=False)
@click.option('--start',
              type=int,
              default=0,
              help='The first scan to visualize')
@click.option('--end',
              type=int,
              default=None,
              help='The Last scan to visualize')
@click.option('--delay',
              type=float,
              default=20E-3,
              help='How much delay between each scan visualization')
@click.option('--capture',
              is_flag=True,
              default=False,
              help='Take a screenshot of the scene')
@click.option('--black',
              is_flag=True,
              default=False,
              help='Use a black background instead of white')
def main(dataset, start, end, delay, capture, black):
    """Visualize all the scans of a given dataset, with the capability of
    selecting a viewpoint and some rendering options.

    This script was designed with the KITTI dataset in mind and it's mostly
    used to visualize that data, when it comes in .ply format. But it could be
    also used for other types of datasets.

    By default it will try to read all the .ply files on the current directory,
    or on the specified dataset directory.

    Viewpoint and Rendering Options: You can move the mouse to select the
    viewpoint that will be used across all the visualizations, and you can also
    change the rendering options, like the point size, colors, etc. This script
    is better understood when trying some examples. IT's safe to use and
    doesn't change any of your data.

    If capture flag is set, a screenshot of each visualization is taken and
    saved to the current directory.
    """
    if dataset:
        scans_path = os.path.join(dataset, '')
    else:
        scans_path = os.path.join(os.getcwd(), '')

    def id_to_file(num):
        scan_id = str(num).zfill(6)
        scan_file = os.path.join(scans_path, scan_id + '.ply')
        return scan_file, scan_id

    print("Saving camera poistions and render options to", tmp_dir)
    os.makedirs(tmp_dir, exist_ok=True)

    # Calculate the amount of scans to visualize
    end = last_file(scans_path) if not end else end
    start = first_file(scans_path) if not start else start
    assert end > start
    print("Rendering scans [{s},{e}] from:{d}".format(s=start,
                                                      e=end,
                                                      d=scans_path))
    # Create capture dir
    if capture:
        dataset_name = dataset.split('/')[-1]
        capture_dir = os.path.join('results', dataset_name)
        os.makedirs(capture_dir, exist_ok=True)

    # Now it's time to create your visualizer
    vis = o3d.visualization.Visualizer()
    vis.create_window()

    # Start rendering from the last viewpoint if exists on the tmp_dir
    last_camera = load_latest_viewpoint(vis)

    # Use black background only if forced through the options
    set_background_color(vis, black)

    # Add the first scan to select the new viewpoint and render options
    first_scan = o3d.io.read_point_cloud(id_to_file(start)[0])
    update_visualizer(vis, last_camera, [first_scan])

    # If you want a new camera/render options you should pick by hand:
    sendmessage('Select a view, then press [q]')
    vis.run()

    # Redundancy does not hurt performance here, we generate duplicate files.
    camera = collect_options_and_camera_position(vis)

    pbar = trange(start, end)
    for idx in pbar:
        pbar.set_description('Visualizing scan {}'.format(str(idx).zfill(6)))
        scan_file, scan_id = id_to_file(idx)
        scan = o3d.io.read_point_cloud(scan_file)
        update_visualizer(vis, camera, [scan])
        if capture:
            # Take a screenshot of the scene, use KITTI format for naming
            image = vis.capture_screen_float_buffer(False)
            plt.imsave(os.path.join(capture_dir, scan_id + ".png"),
                       np.asarray(image), dpi=1)
        else:
            time.sleep(delay)


if __name__ == "__main__":
    main()
