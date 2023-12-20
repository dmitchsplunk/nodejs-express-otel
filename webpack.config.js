const path = require('path');

module.exports = {
    mode: 'production',
    entry: './index.js',
    output: {
        path: path.join(__dirname, 'dist'),
        publicPath: '/',
        filename: 'final.js',
    },
    target: 'node',
    externalsType: "node-commonjs",
    externals: [
        "express"
        // See https://github.com/open-telemetry/opentelemetry-js-contrib/tree/main/plugins/node
        // for a list of supported instrumentations. Use the require name of the library or framework,
        // not the name of the instrumentation. For example, "tedious" instead of "instrumentation-tedious".
    ]
};