#!/usr/bin/env python3
# @file      inspect_geometry.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
import click
import ipdb
import open3d as o3d

from print_geometry_type import is_mesh


@click.command()
@click.argument('filename', type=click.Path(exists=True))
def main(filename):
    """Read a given geomtry from the filesystem and launch a ipdb debugger."""
    if is_mesh(filename):
        print("Reding TriangleMesh object:", filename)
        geom = o3d.io.read_triangle_mesh(filename, print_progress=True)
        geom.compute_vertex_normals()
    else:
        print("Reding PointCloud object:", filename)
        geom = o3d.io.read_point_cloud(filename, print_progress=True)
        print(geom)

    print("Launching debugging session")
    ipdb.set_trace()
    print(geom)
    o3d.visualization.draw_geometries([geom])


if __name__ == "__main__":
    main()
