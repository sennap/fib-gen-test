#! /usr/bin/env node
'use strict';

var GENERATE_TO = process.argv.slice(2);
var sequence = [0, 1];

for (var i = 0; i < GENERATE_TO; i++) {
    sequence.push(sequence[0] + sequence[1]);
    sequence.splice(0, 1);
    console.log(sequence[1]);
}
