import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure PredatorPreyPackage where
  preyGrowthRate : ℝ
  predationRate : ℝ
  predatorEfficiency : ℝ
  predatorDeathRate : ℝ
  equilibriumState : ℝ × ℝ

structure EcosystemDynamicsEvidence (E : PredatorPreyPackage) where
  preyGrowthRateClosed : E.preyGrowthRate > 0
  predationRateClosed : E.predationRate ≥ 0
  predatorEfficiencyClosed : E.predatorEfficiency > 0
  predatorDeathRateClosed : E.predatorDeathRate ≥ 0
  equilibriumStateClosed : (E.equilibriumState.1 > 0) ∧ (E.equilibriumState.2 > 0)

def EcosystemDynamicsClosed (E : PredatorPreyPackage) : Prop :=
  E.preyGrowthRate > 0 ∧ E.predationRate ≥ 0 ∧ E.predatorEfficiency > 0 ∧
  E.predatorDeathRate ≥ 0 ∧ (E.equilibriumState.1 > 0) ∧ (E.equilibriumState.2 > 0)

theorem ecosystem_dynamics_closed_from_evidence (E : PredatorPreyPackage)
    (Ev : EcosystemDynamicsEvidence E) : EcosystemDynamicsClosed E := by
  exact And.intro Ev.preyGrowthRateClosed (And.intro Ev.predationRateClosed
    (And.intro Ev.predatorEfficiencyClosed (And.intro Ev.predatorDeathRateClosed
      Ev.equilibriumStateClosed)))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse