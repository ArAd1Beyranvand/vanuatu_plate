"""Port of vanuatu_plate/lib/src/vanuatu_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import (
    GatedPlateValidator, PlateEntry, PlateValidation, is_digits, restriction_verdict)

_CODE = re.compile(r"[A-Z]{4}")


class VanuatuValidator(GatedPlateValidator):
    gate_group = "number"
    reason_number = "The number is 1 to 5 digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        number = entry.group("number")
        if not number or len(number) > 5 or not is_digits(number):
            return PlateValidation.invalid(self.reason_number)
        return PlateValidation.valid()


class VanuatuDiplomaticValidator(GatedPlateValidator):
    gate_group = "serial"
    reason_code = "The code is four letters."
    reason_serial = "The serial is one digit."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not _CODE.fullmatch(entry.group("code")):
            return PlateValidation.invalid(self.reason_code)
        serial = entry.group("serial")
        if len(serial) != 1 or not is_digits(serial):
            return PlateValidation.invalid(self.reason_serial)
        return PlateValidation.valid()
