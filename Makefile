# Makefile for running tests from command line

PROJECT = FunWithUITests.xcodeproj
SCHEME = FunWithUITests
PLATFORM = iOS Simulator
SIMULATOR = iPhone SE (2nd generation)
OSVER = 13.5

default:
	@echo
	@echo "Targets:"
	@echo "  test-all"
	@echo "  test-unit-all"
	@echo "  test-ui-all"
	@echo "  test-ui-screen-change"
	@echo "  test-ui-temp-conv"
	@echo

test-all:
	xcodebuild test \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-destination 'platform=$(PLATFORM),name=$(SIMULATOR),OS=$(OSVER)'

test-unit-all:
	xcodebuild test \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-destination 'platform=$(PLATFORM),name=$(SIMULATOR),OS=$(OSVER)' \
	-only-testing FunWithUITestsTests

test-ui-all:
	xcodebuild test \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-destination 'platform=$(PLATFORM),name=$(SIMULATOR),OS=$(OSVER)' \
	-only-testing FunWithUITestsUITests

test-ui-screen-change:
	xcodebuild test \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-destination 'platform=$(PLATFORM),name=$(SIMULATOR),OS=$(OSVER)' \
	-only-testing FunWithUITestsUITests/ScreenChangeTests

test-ui-temp-conv:
	xcodebuild test \
	-project $(PROJECT) \
	-scheme $(SCHEME) \
	-destination 'platform=$(PLATFORM),name=$(SIMULATOR),OS=$(OSVER)' \
	-only-testing FunWithUITestsUITests/TemperatureConversionTests
