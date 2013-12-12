# angular.vim

[![Build Status](https://travis-ci.org/stevemartin/angular.vim.png?branch=master)](https://travis-ci.org/stevemartin/angular.vim)

## Plugin aims

This plugin aims to act as a wrapper around the [angular seed](https://github.com/angular/angular-seed) project, to give you some convenience functions for interacting with it.

### Usage
Navigate between the different angular js files and add controllers, directives or services if they dont exist:

### Commands

    :AApp
    :AApp my_app

    :AControllers
    :AController my_controller

    :ADirective my_directive
    :ADirectives

    :AFilters
    :AFilter my_filter

    :AServices
    :AService my_service

    :AModules
    :AModule my_module

#### Built in mappings:

    <leader>aa for app.js
    <leader>ac for controllers.js
    <leader>ad for directives.js
    <leader>af for filters.js
    <leader>as for services.js
