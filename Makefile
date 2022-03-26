RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
BLUE := $(shell tput -Txterm setaf 4)
WHITE := $(shell tput -Txterm setaf 7)
RESET := $(shell tput -Txterm sgr0)

# Show help
help:
	@echo '${WHITE}Usage:${RESET}'
	@echo '	${RED}make${RESET} ${GREEN}<target>${RESET}'
	@echo '${WHITE}Commands:${RESET}'
	@echo '	${BLUE}Show help${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}help${RESET}'
	@echo '	${BLUE}Initialize the project${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}init${RESET}'

# Initialize the project
init:
	pod install
	pod update
	Pods/Swiftlint/swiftlint --fix
	@echo '${RED}Linter:${RESET}'
	Pods/Swiftlint/swiftlint

commit:
	git add .
	git commit -m "$t" -m "$b"
	git push --set-upstream origin '$(git rev-parse --abbrev-ref HEAD)'

