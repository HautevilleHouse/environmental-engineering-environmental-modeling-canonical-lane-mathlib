import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure AdvectionDiffusionPackage where
  advectionEquation : Prop
  diffusionEquation : Prop
  dispersionModel : Prop
  reactionTerms : Prop

structure AdvectionDiffusionEvidence (P : AdvectionDiffusionPackage) where
  advectionEquationClosed : P.advectionEquation
  diffusionEquationClosed : P.diffusionEquation
  dispersionModelClosed : P.dispersionModel
  reactionTermsClosed : P.reactionTerms

def AdvectionDiffusionClosed (P : AdvectionDiffusionPackage) : Prop :=
  P.advectionEquation ∧ P.diffusionEquation ∧ P.dispersionModel ∧ P.reactionTerms

theorem advection_diffusion_closed_from_evidence (P : AdvectionDiffusionPackage)
    (E : AdvectionDiffusionEvidence P) : AdvectionDiffusionClosed P := by
  exact And.intro E.advectionEquationClosed
    (And.intro E.diffusionEquationClosed
      (And.intro E.dispersionModelClosed E.reactionTermsClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse