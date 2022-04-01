RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE := $(shell tput -Txterm setaf 4)
MAGENTA := $(shell tput -Txterm setaf 5)
WHITE := $(shell tput -Txterm setaf 7)
RESET := $(shell tput -Txterm sgr0)
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
export CURRENT_PROJECT = TheBean

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
	@echo '	${BLUE}Open workspace in XCode${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}open${RESET}'
# run
	@echo '	${BLUE}Init project and open workspace${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}run${RESET}'
# tic
	@echo '	${BLUE}Create new ticket branch${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}tic${RESET} ${YELLOW}t=<TICKET_NUMBER>${RESET}'
# clean
	@echo '	${BLUE}Clean DerivedData directory${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}clean${RESET}'
# pod
	@echo '	${BLUE}Install and update pods${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}pod${RESET}'
# git
	@echo '	${BLUE}Make a commit and push to the origin${RESET}:'
	@echo '		${RED}make${RESET} ${GREEN}git${RESET} ${YELLOW}t="text"${RESET} ${MAGENTA}[b="body"]${RESET}'

# Initialize the project
init:
	@echo '⏳	${YELLOW}Initializing $(CURRENT_PROJECT) project:${RESET}'

	@echo '⏳	${YELLOW}Installing xcodegen:${RESET}'
	@brew upgrade xcodegen || brew install xcodegen || (echo '${RED}Failed to install xcodegen${RESET}' && exit 1)
	@echo '✅	${GREEN}xcodegen installed successfully${RESET}'

	@echo '⏳	${YELLOW}Executing xcodegen:${RESET}'
	@xcodegen || (echo '❌	${RED}Failed to run xcodegen${RESET}' && exit 1)
	@echo '✅	${GREEN}xcodegen executed successfully${RESET}'

	@make pod

	@make lint

	@echo '✅	${GREEN}Project $(CURRENT_PROJECT) initialized successfully${RESET}'

# Run linter check and fix
lint:
	@echo '⏳	${YELLOW}Running Linter:${RESET}'

	@echo '⏳	${YELLOW}Updating swiftlint:${RESET}'
	@brew upgrade swiftlint || brew install swiftlint || (echo '❌	${RED}Failed to install swiftlint${RESET}' && exit 1)
	@echo '✅	${GREEN}Swiftlint updated successfully${RESET}'
	
	@echo '⏳	${YELLOW}Running swiftlint fix:${RESET}'
	@Pods/SwiftLint/swiftlint --fix || (echo '❌	${RED}Failed to run swiftlint fix${RESET}' && exit 1)
	@echo '✅	${GREEN}Swiftlint fix executed successfully${RESET}'

	@echo '⏳	${YELLOW}Running swiftlint:${RESET}'
	@Pods/SwiftLint/swiftlint || (echo '❌	${RED}Failed to run swiftlint${RESET}' && exit 1)
	@echo '✅	${GREEN}Swiftlint executed successfully${RESET}'

# Open workspace in XCode
open:
	@echo '⏳	${YELLOW}Opening workspace for $(CURRENT_PROJECT):${RESET}'
	@open $(CURRENT_PROJECT).xcworkspace || (echo '❌	${RED}Failed to open $(CURRENT_PROJECT) workspace${RESET}' && exit 1)
	@echo '✅	${GREEN}$(CURRENT_PROJECT) workspace opened successfully${RESET}'

# Init project and open workspace
run:
	@make init
	@make open

# Create new ticket branch
tic:
	@echo '⏳	${YELLOW}Creating new branch [TIC-$t]:${RESET}'

	@echo '⏳	${YELLOW}Fetching:${RESET}'
	@git fetch || (echo '❌	${RED}Failed to fetch${RESET}' && exit 1)
	@echo '✅	${GREEN}Fetched successfully${RESET}'

	@echo '⏳	${YELLOW}Checking out developer branch:${RESET}'
	@git checkout dev || (echo '❌	${RED}Failed to checkout [dev]${RESET}' && exit 1)
	@echo '✅	${GREEN}Developer branch checked out successfully${RESET}'

	@echo '⏳	${YELLOW}Pulling updates:${RESET}'
	@git pull || (echo '❌	${RED}Failed to pull [dev]${RESET}' && exit 1)
	@echo '✅	${GREEN}Updates pulled successfully${RESET}'

	@echo '⏳	${YELLOW}Checking out new  ticket branch [TIC-$t]:${RESET}'
	@git checkout -b TIC-$t || (git checkout TIC-$t && git pull) || (echo '❌	${RED}Failed to checkout new branch [TIC-$t]${RESET}' && exit 1)
	@echo '✅	${GREEN}New branch [TIC-$t] created successfully${RESET}'

# Clean DerivedData directory
clean:
	@echo '⏳	${YELLOW}Cleaning cache:${RESET}'
	@rm -rf ~/Library/Developer/Xcode/DerivedData/* || (echo '❌	${RED}Failed to clean cache${RESET}' && exit 1)
	@echo '✅	${GREEN}Cache cleaned successfully${RESET}'

# Install and update pods
pod:
	@echo '⏳	${YELLOW}Updating Cocoapods:${RESET}'
	@brew upgrade cocoapods || brew install cocoapods || (echo '❌	${RED}Failed to install cocoapods${RESET}' && exit 1)
	@echo '✅	${GREEN}Cocoapods updated successfully${RESET}'

	@echo '⏳	${YELLOW}Installing Pods:${RESET}'
	@pod install || (echo '❌	${RED}Failed to install Pods${RESET}' && exit 1)
	@echo '✅	${GREEN}Pods installed successfully${RESET}'

	@echo '⏳	${YELLOW}Updating pods:${RESET}'
	@pod update || (echo '❌	${RED}Failed to update Pods${RESET}' && exit 1)
	@echo '✅	${GREEN}Pods updated successfully${RESET}'
	
# Make a commit and push to the origin
git:
	@make lint

	@echo '⏳	${YELLOW}Adding files:${RESET}'
	@git add . || (echo '❌	${RED}Failed to add files${RESET}' && exit 1)
	@echo '✅	${GREEN}Files added successfully${RESET}'

	@echo '⏳	${YELLOW}Committing:${RESET}'
	@git commit -m "$t" -m "$b" || (echo '❌	${RED}Failed to commit${RESET}' && exit 1)
	@echo '✅	${GREEN}Changes commiteted successfully${RESET}'

	@echo '⏳	${YELLOW}Pushing to origin:${RESET}'
	@git push --set-upstream origin $(BRANCH) || (echo '❌	${RED}Failed to push${RESET}' && exit 1)
	@echo '✅	${GREEN}Changes pushed successfully${RESET}'
	
	@echo '✅	${GREEN}Successfully!${RESET}'
