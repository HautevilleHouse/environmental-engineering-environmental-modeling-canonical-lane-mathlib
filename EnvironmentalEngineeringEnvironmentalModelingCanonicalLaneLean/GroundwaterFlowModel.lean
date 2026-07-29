import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure DarcyFlowPackage where
  hydraulicConductivity : ℝ
  hydraulicGradient : ℝ
  crossSectionalArea : ℝ
  darcyVelocity : ℝ

structure GroundwaterFlowEvidence (G : DarcyFlowPackage) where
  hydraulicConductivityClosed : G.hydraulicConductivity > 0
  hydraulicGradientClosed : G.hydraulicGradient ≥ 0
  crossSectionalAreaClosed : G.crossSectionalArea > 0
  darcyVelocityClosed : G.darcyVelocity ≥ 0

def GroundwaterFlowClosed (G : DarcyFlowPackage) : Prop :=
  G.hydraulicConductivity > 0 ∧ G.hydraulicGradient ≥ 0 ∧ G.crossSectionalArea > 0 ∧ G.darcyVelocity ≥ 0

theorem groundwater_flow_closed_from_evidence (G : DarcyFlowPackage)
    (E : GroundwaterFlowEvidence G) : GroundwaterFlowClosed G := by
  exact And.intro E.hydraulicConductivityClosed (And.intro E.hydraulicGradientClosed
    (And.intro E.crossSectionalAreaClosed E.darcyVelocityClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse