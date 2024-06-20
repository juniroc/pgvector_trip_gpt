CREATE TABLE experiments (
    experiment_id SERIAL NOT NULL,
    name VARCHAR(256) NOT NULL,
    artifact_location VARCHAR(256),
    lifecycle_stage VARCHAR(32),
    CONSTRAINT experiment_pk PRIMARY KEY (experiment_id),
    CONSTRAINT experiments_lifecycle_stage CHECK (lifecycle_stage IN ('active', 'deleted')),
    UNIQUE (name)
    )

COMMENT ON TABLE experiments.experiment_id IS '실험 id';
COMMENT ON COLUMN experiments.name IS 'Model 실험 이름';
COMMENT ON COLUMN experiments.artifact_location IS 'artifact 저장 위치';
COMMENT ON COLUMN experiments.lifecycle_stage IS 'life cycle stage';
COMMENT ON COLUMN experiments.experiment_pk IS '실험 id PK';
COMMENT ON COLUMN experiments.experiments_lifecycle_stage IS 'lifecycle stage 제약조건';
