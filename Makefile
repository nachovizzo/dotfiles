root:
	@docker build -t nachovizzo/dotfiles .

run:
	@docker run --rm -it nachovizzo/dotfiles
