# LiveG OS Update Files
Our update scripts and files used to release new versions of LiveG OS.

Licensed by the [LiveG Open-Source Licence](LICENCE.md).

## Prerequisites
Install the Node.js packages required to build releases:

```bash
npm install
```

## Building a release
To build a release, you'll first need to edit the `release.json` file to include the release information. You'll also need to supply some extra files (such as the gShell executable for different architectures) and put them in the `files` directory. Once complete, run:

```
./buildrelease
```

This will build the release, which might take about a minute or so to create the release archive and put it in `releases`. `releases/index.json` and `releases/index.json.sig` will be updated to include the new release configuration.