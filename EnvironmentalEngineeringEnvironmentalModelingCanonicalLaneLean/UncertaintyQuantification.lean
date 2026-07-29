import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure UncertaintyQuantificationPackage where
  parameterUncertainty : Prop
  modelStructureUncertainty : Prop
  ensembleSimulation : Prop
  bayesianInference : Prop
  predictionInterval : Prop

structure UncertaintyQuantificationEvidence (U : UncertaintyQuantificationPackage) where
  parameterUncertaintyClosed : U.parameterUncertainty
  modelStructureUncertaintyClosed : U.modelStructureUncertainty
  ensembleSimulationClosed : U.ensembleSimulation
  bayesianInferenceClosed : U.bayesianInference
  predictionIntervalClosed : U.predictionInterval

def UncertaintyQuantificationClosed (U : UncertaintyQuantificationPackage) : Prop :=
  U.parameterUncertainty ∧ U.modelStructureUncertainty ∧ U.ensembleSimulation ∧
  U.bayesianInference ∧ U.predictionInterval

theorem uncertainty_quantification_closed_from_evidence
    (U : UncertaintyQuantificationPackage) (E : UncertaintyQuantificationEvidence U) :
    UncertaintyQuantificationClosed U := by
  exact And.intro E.parameterUncertaintyClosed
    (And.intro E.modelStructureUncertaintyClosed
      (And.intro E.ensembleSimulationClosed
        (And.intro E.bayesianInferenceClosed E.predictionIntervalClosed)))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse