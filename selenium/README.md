# Selenium Testing

Selenium Webdriver is used to simulate basic user-tests on Grafana's User Interface.

This document aims to explain the basic method behind the Selenium tests. 

Creating your own test may require more than what's given here. For further reading on Selenium Webdriver, its methods, and syntax, see the [Selenium Webdriver Documentation](https://selenium-python.readthedocs.io).

> If you are familiar with XPath, creating a new test should be fairly straightforward.

## Requirements

- Python

- Python Pip

- Firefox

- Cronus Monitoring Stack

- Kubernetes API Access

## Installation

Installation of Selenium should be handled automatically during the main stack initialization process, and the software will be installed onto your chosen controlling machine.

If you need to re-install Selenium, run `initSelenium.sh`.

## Tests

Tests are run through the `doorTest.sh` script, which dynamically gets the IP address of the running Grafana instance and runs the test scripts on it.

### Login

The main purpose of this test is to ensure that the Grafana pod is functional and ready for user interaction.

To ensure this, the test simulates a user opening up the Grafana User Interface and logging in. 

The general algorithm is given below, and is reflected in `login.py`.

#### Login Sequence

- Initialize Firefox WebDriver

- Load desired page

- Wait for page to load

- Input credentials

- Submit Form

### Dashboard Test

The main purpose of this test is to ensure that the dashboards were imported into Grafana properly, and that no errors occurred during import.

Only the Restarts Dashboard is tested due to it having a static UID. But some extra logic could be used to dynamically grab UIDs and test other dashboards.

The general algorithm is given below, and is reflected in `dashboardTest.py`.

#### Dashboard Test Sequence

- Login Sequence (given above)

- Navigate to Dashboards List page

- Navigate to a Specific Dashboard

- Assert that a panel has imported properly
