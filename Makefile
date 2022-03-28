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
# help
	@echo '	${BLUE}Show help${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}help${RESET}'
# init
	@echo '	${BLUE}Initialize the project${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}init${RESET}'
# lint
	@echo '	${BLUE}Run linter check and fix${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}lint${RESET}'
# open
	@echo '	${BLUE}Open work in XCode${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}open${RESET}'
# run
	@echo '	${BLUE}Init project and open workspace${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}run${RESET}'
# clean
	@echo '	${BLUE}Clean DerivedData directory${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}clean${RESET}'
# pods
	@echo '	${BLUE}Install and update pods${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}pods${RESET}'
# git
	@echo '	${BLUE}Make a commit and push to the origin${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}git${RESET} ${YELLOW}t="text"${RESET} ${MAGENTA}[b="body"]${RESET}'

# Initialize the project
init:
	brew ls --versions xcodegen || brew install xcodegen
	xcodegen
	pod install
	pod update
	make lint

# Run linter check and fix
lint:
	Pods/Swiftlint/swiftlint --fix
	@echo '${RED}Linter:${RESET}'
	Pods/Swiftlint/swiftlint

# Open work in XCode
open:
	open TheBean.xcworkspace

# Init project and open workspace
run:
	make init
	make open

# Clean DerivedData directory
clean:
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	
# Install and update pods
pods:
	pod install
	pod update
	
# Make a commit and push to the origin
git:
	make lint
	git add .
	git commit -m "$t" -m "$b"
	git push --set-upstream origin
