cwlVersion: v1.0
class: CommandLineTool
id: bunny-cli
label: bunny-cli

hints:
    DockerRequirement:
        dockerPull: ghcr.io/health-informatics-uon/hutch/bunny:1.0.0-alpha.3

baseCommand: [uv, run, bunny]

requirements:
  EnvVarRequirement:
    envDef:
      DATASOURCE_DB_USERNAME: $(inputs.db_username)
      DATASOURCE_DB_PASSWORD: $(inputs.db_password)
      DATASOURCE_DB_DATABASE: $(inputs.db_database)
      DATASOURCE_DB_DRIVERNAME: $(inputs.db_driver)
      DATASOURCE_DB_SCHEMA: $(inputs.db_schema)
      DATASOURCE_DB_PORT: $(inputs.db_port)
      DATASOURCE_DB_HOST: $(inputs.db_host)

inputs:
    body:
        type: File
        inputBinding:
            position: 1
            prefix: --body
    result_modifiers:
        type: string?
        inputBinding:
            position: 2
            prefix: -m
    results:
        type: string?
        inputBinding:
            position: 3
            prefix: -o
    db_username: string
    db_password: string
    db_database: string
    db_driver: string
    db_schema: string
    db_port: string
    db_host: string

outputs:
    output_file:
        type: File
        outputBinding:
            glob: "output.json"
