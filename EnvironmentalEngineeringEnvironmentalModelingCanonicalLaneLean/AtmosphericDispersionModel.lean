import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure GaussianPlumePackage where
  sourceStrength : ℝ
  windSpeed : ℝ
  dispersionCoefficients : ℝ × ℝ × ℝ
  concentrationProfile : ℝ → ℝ → ℝ → ℝ

structure AtmosphericDispersionEvidence (G : GaussianPlumePackage) where
  sourceStrengthClosed : G.sourceStrength > 0
  windSpeedClosed : G.windSpeed > 0
  concentrationProfileClosed : ∀ x y z, G.concentrationProfile x y z ≥ 0

def AtmosphericDispersionClosed (G : GaussianPlumePackage) : Prop :=
  G.sourceStrength > 0 ∧ G.windSpeed > 0 ∧ (∀ x y z, G.concentrationProfile x y z ≥ 0)

theorem atmospheric_dispersion_closed_from_evidence (G : GaussianPlumePackage)
    (E : AtmosphericDispersionEvidence G) : AtmosphericDispersionClosed G := by
  exact And.intro E.sourceStrengthClosed (And.intro E.windSpeedClosed E.concentrationProfileClosed)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse