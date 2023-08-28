root:
	@docker build -t nachovizzo/dotfiles .

no-cache:
	@docker build --no-cache -t nachovizzo/dotfiles .

run:
	@docker run --rm -it nachovizzo/dotfiles
