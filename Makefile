root:
	@docker buildx build --no-cache -t nachovizzo/dotfiles .

run:
	@docker run --rm -it nachovizzo/dotfiles
