import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure MultiphaseFlowPackage where
  phasePresence : Prop
  capillaryPressureModel : Prop
  relativePermeabilityModel : Prop
  massTransferBetweenPhases : Prop
  saturationEquation : Prop

structure MultiphaseFlowEvidence (M : MultiphaseFlowPackage) where
  phasePresenceClosed : M.phasePresence
  capillaryPressureModelClosed : M.capillaryPressureModel
  relativePermeabilityModelClosed : M.relativePermeabilityModel
  massTransferBetweenPhasesClosed : M.massTransferBetweenPhases
  saturationEquationClosed : M.saturationEquation

def MultiphaseFlowClosed (M : MultiphaseFlowPackage) : Prop :=
  M.phasePresence ∧ M.capillaryPressureModel ∧ M.relativePermeabilityModel ∧
  M.massTransferBetweenPhases ∧ M.saturationEquation

theorem multiphase_flow_closed_from_evidence
    (M : MultiphaseFlowPackage) (E : MultiphaseFlowEvidence M) :
    MultiphaseFlowClosed M := by
  exact And.intro E.phasePresenceClosed
    (And.intro E.capillaryPressureModelClosed
      (And.intro E.relativePermeabilityModelClosed
        (And.intro E.massTransferBetweenPhasesClosed E.saturationEquationClosed)))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse