import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean.GroundwaterFlowModel

/-!
# Multiphase Flow Package
-/

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure MultiphaseFlowPackage
    {G : GroundwaterFlowModelPackage} where
  phaseSaturations : Type u
  capillaryPressure : Type v
  relativePermeability : Type w
  massConservationEquations : Prop
  phaseMomentumEquations : Prop
  constitutiveRelations : Prop

structure MultiphaseFlowEvidence
    {G : GroundwaterFlowModelPackage}
    (M : MultiphaseFlowPackage G) where
  massConservationEquationsClosed : M.massConservationEquations
  phaseMomentumEquationsClosed : M.phaseMomentumEquations
  constitutiveRelationsClosed : M.constitutiveRelations

def MultiphaseFlowClosed
    {G : GroundwaterFlowModelPackage}
    (M : MultiphaseFlowPackage G) : Prop :=
  M.massConservationEquations ∧ M.phaseMomentumEquations ∧ M.constitutiveRelations

theorem multiphase_flow_closed_from_evidence
    {G : GroundwaterFlowModelPackage}
    (M : MultiphaseFlowPackage G)
    (E : MultiphaseFlowEvidence M) :
    MultiphaseFlowClosed M := by
  exact And.intro E.massConservationEquationsClosed
    (And.intro E.phaseMomentumEquationsClosed E.constitutiveRelationsClosed)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse
