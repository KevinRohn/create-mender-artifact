# Create mender artifact module-image docker action

This actions generates an mender [artifact](https://docs.mender.io/3.1/artifact-creation) file.

The action is running in a docker container.

It uses the current mender-artifact version _`3.6.1`_. 
See the [mender-artifact](https://docs.mender.io/3.1/artifact-creation/state-scripts) documentation page for more information.


## Inputs

### `artifact-name`

_Description:_

Name of the artifact

_Required:_ *true*

### `device-type`

_Description:_

Type of device(s) supported by the Artifact. You can specify multiple compatible devices providing this parameter multiple times.

_Required:_ *true*

### `type`

_Description:_

Type of payload. This is the same as the name of the update module.

_Required:_ *true*

### `artifact-content`

_Description:_

Content for the artifact payload, based on the payload type.

_Required:_ *true*

### `output-path`

_Description:_

Full path to output artifact file.

_Required:_ *true*

### `state-scripts`

_Description:_

Full path to the state script(s). You can specify multiple scripts providing this parameter multiple times.

_Required:_ *false*


See mender documentation [state-scripts](https://docs.mender.io/artifact-creation/state-scripts) for more information.

### `software-name`

_Description:_

Name of the key to store the software version: rootfs-image.NAME.version, instead of rootfs-image.PAYLOAD_TYPE.version.

_Required:_ *false*

### `software-version`

_Description:_

Value for the software version, defaults to the name of the artifact.

_Required:_ *false*


See mender documentation [software versioning](https://docs.mender.io/artifact-creation/software-versioning) for more information.

## Outputs

### `path-to-artifact`

The path to the generated mender artifact.

## Example usage

```yaml
      - name: create mender artifact
        id: artifact
        uses: KevinRohn/create-mender-artifact@main
        with: 
          artifact-name: "test-artifact" 
          device-type: "raspberrypi3"  # device type, add multiple device types with comma separator (e.g.: "raspberrypi3,mydevice" )
          type: "deb" # module type
          artifact-content: "content" # contains *.deb files
          output-path: "out"
          state-scripts: "state_scripts" # optional: folder to the state scripts
          software-name: "my-app" # optional: software name
          software-version: "v1.0" # optional: software version

      - name: check-output
        run: |
          echo ${{ steps.artifact.outputs.path-to-artifact }}
```


## Progress

| Options                       | State              |
| ----------------------------- | ------------------ |
| --artifact-name               | :white_check_mark: |
| --device-type                 | :white_check_mark: |
| --type                        | :white_check_mark: |
| --artifact-name-depends       | :x:                |
| --augment-file                | :x:                |
| --augment-meta-data           | :x:                |
| --augment-provides            | :x:                |
| --augment-type                | :x:                |
| --clears-provides             | :x:                |
| --compression                 | :x:                |
| --depends                     | :x:                |
| --depends-groups              | :x:                |
| --file                        | :white_check_mark: |
| --key                         | :x:                |
| --meta-data                   | :x:                |
| --no-default-clears-provides  | :x:                |
| --no-default-software-version | :x:                |
| --output-path                 | :white_check_mark: |
| --provides                    | :x:                |
| --provides-group              | :x:                |
| --script                      | :white_check_mark: |
| --software-filesystem         | :x:                |
| --software-name               | :white_check_mark: |
| --software-version            | :white_check_mark: |
| --version                     | :x:                |