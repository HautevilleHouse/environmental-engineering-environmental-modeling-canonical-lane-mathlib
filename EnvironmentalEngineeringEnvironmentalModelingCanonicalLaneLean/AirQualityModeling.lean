import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure AirQualityPackage where
  atmosphericDispersion : Prop
  chemicalTransformations : Prop
  aerosolDynamics : Prop
  depositionProcesses : Prop

structure AirQualityEvidence (P : AirQualityPackage) where
  atmosphericDispersionClosed : P.atmosphericDispersion
  chemicalTransformationsClosed : P.chemicalTransformations
  aerosolDynamicsClosed : P.aerosolDynamics
  depositionProcessesClosed : P.depositionProcesses

def AirQualityClosed (P : AirQualityPackage) : Prop :=
  P.atmosphericDispersion ∧ P.chemicalTransformations ∧ P.aerosolDynamics ∧ P.depositionProcesses

theorem air_quality_closed_from_evidence (P : AirQualityPackage)
    (E : AirQualityEvidence P) : AirQualityClosed P := by
  exact And.intro E.atmosphericDispersionClosed
    (And.intro E.chemicalTransformationsClosed
      (And.intro E.aerosolDynamicsClosed E.depositionProcessesClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse