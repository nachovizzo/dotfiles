root:
	@docker build -t --no-cache nachovizzo/dotfiles .

run:
	@docker run --rm -it nachovizzo/dotfiles
