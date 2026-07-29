import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure ContaminantTransportPDEPackage where
  timeParameter : Type u
  concentrationField : timeParameter -> Type v
  initialConditionMatches : Prop
  differentiableConcentrationFamily : Prop
  advectionDispersionEquation : Prop
  boundaryConditions : Prop

structure ContaminantTransportPDEEvidence (C : ContaminantTransportPDEPackage) where
  initialConditionMatchesClosed : C.initialConditionMatches
  differentiableConcentrationFamilyClosed : C.differentiableConcentrationFamily
  advectionDispersionEquationClosed : C.advectionDispersionEquation
  boundaryConditionsClosed : C.boundaryConditions

def ContaminantTransportPDEClosed (C : ContaminantTransportPDEPackage) : Prop :=
  C.initialConditionMatches ∧
  C.differentiableConcentrationFamily ∧
  C.advectionDispersionEquation ∧
  C.boundaryConditions

theorem contaminant_transport_pde_closed_from_evidence
    (C : ContaminantTransportPDEPackage) (E : ContaminantTransportPDEEvidence C) :
    ContaminantTransportPDEClosed C := by
  exact And.intro E.initialConditionMatchesClosed
    (And.intro E.differentiableConcentrationFamilyClosed
      (And.intro E.advectionDispersionEquationClosed E.boundaryConditionsClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse