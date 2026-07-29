import canonicalLaneMathlib.AdmissibleClass

/-!
# Advection-Diffusion Transport Package
-/

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure AdvectionDiffusionTransportPackage where
  flowField : Type u
  diffusivityTensor : Type v
  sourceSinkTerm : Type w
  initialCondition : Prop
  boundaryCondition : Prop
  wellPosedness : Prop

structure AdvectionDiffusionTransportEvidence (P : AdvectionDiffusionTransportPackage) where
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition
  wellPosednessClosed : P.wellPosedness

def AdvectionDiffusionTransportClosed (P : AdvectionDiffusionTransportPackage) : Prop :=
  P.initialCondition ∧ P.boundaryCondition ∧ P.wellPosedness

theorem advection_diffusion_transport_closed_from_evidence
    (P : AdvectionDiffusionTransportPackage)
    (E : AdvectionDiffusionTransportEvidence P) :
    AdvectionDiffusionTransportClosed P := by
  exact And.intro E.initialConditionClosed
    (And.intro E.boundaryConditionClosed E.wellPosednessClosed)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse
