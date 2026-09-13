#!/bin/bash

check perl      perl -e ''
check Expect.pm perl -e 'use Expect'
check IO-Tty    perl -e 'use IO::Tty'
