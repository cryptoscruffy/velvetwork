package logger

import (
	"go.uber.org/zap"
)

var Log = zap.NewNop()

func Initialize(level string, outputs []string) error {
	lvl, err := zap.ParseAtomicLevel(level)
	if err != nil {
		return err
	}
	cfg := zap.NewDevelopmentConfig()
	cfg.Level = lvl
	if len(outputs) > 0 {
		cfg.OutputPaths = outputs
		cfg.ErrorOutputPaths = outputs
	}
	zl, err := cfg.Build()
	if err != nil {
		return err
	}
	Log = zl
	return nil
}
