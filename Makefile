.PHONY: test lint check

# Run the bats test suite.
test:
	bats tests/*.bats

# Static analysis of every shell script (warning severity or worse fails).
lint:
	shellcheck -S warning \
		exampractice.sh update.sh \
		.resources/main/*.sh \
		$$(find .resources -name tester.sh)

# Everything CI runs.
check: lint test
