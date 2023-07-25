package api

import (
	"simpleBank/util"

	"github.com/go-playground/validator/v10"
)

var validCurrency validator.Func = func(fileLevel validator.FieldLevel) bool {
	if currency, ok := fileLevel.Field().Interface().(string); ok {
		return util.IsSupportedCurrency(currency)
	}
	return false
}
