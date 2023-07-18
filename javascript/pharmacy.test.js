import { describe, it } from "node:test";
import assert from "node:assert";
import { Drug, Pharmacy } from "./pharmacy.js";

describe("Pharmacy", () => {
  it("should decrease the benefit and expiresIn", () => {
    assert.deepEqual(
      new Pharmacy([new Drug("test", 2, 3)]).updateBenefitValue(),
      [new Drug("test", 1, 2)]
    );
  });
});
