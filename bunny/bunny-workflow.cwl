cwlVersion: v1.0
class: Workflow
id: bunny-workflow
label: bunny-workflow

inputs:
    body: File
    result_modifiers: string?
    results: string?
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
        outputSource: run_query/output_file

steps:
    run_query:
        run: ./bunny-cli.cwl
        in:
            body: body
            result_modifiers: result_modifiers
            results: results
            db_username: db_username
            db_password: db_password
            db_database: db_database
            db_driver: db_driver
            db_schema: db_schema
            db_port: db_port
            db_host: db_host
            
        out: [output_file]
