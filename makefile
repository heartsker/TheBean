RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE := $(shell tput -Txterm setaf 4)
MAGENTA := $(shell tput -Txterm setaf 5)
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
	@echo '	${BLUE}Make a commit and push to the origin${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}git${RESET} ${YELLOW}t="text"${RESET} ${MAGENTA}[b="body"]${RESET}'

# Initialize the project
init:
	brew ls --versions xcodegen || brew install xcodegen
	xcodegen
	pod install
	pod update
	Pods/Swiftlint/swiftlint --fix
	@echo '${RED}Linter:${RESET}'
	Pods/Swiftlint/swiftlint

# Make a commit and push to the origin
git:
	git add .
	git commit -m "$t" -m "$b"
	git push --set-upstream origin

