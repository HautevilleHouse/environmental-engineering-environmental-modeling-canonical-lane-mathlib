import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure GroundwaterContaminantTransport where
  aquiferGeometry : Type u
  hydraulicConductivity : Type v
  retardationFactor : Type w
  advectionTerm : Prop
  dispersionTerm : Prop
  reactionTerm : Prop
  transportEquationClosed : Prop

structure GroundwaterTransportEvidence (T : GroundwaterContaminantTransport) where
  advectionTermClosed : T.advectionTerm
  dispersionTermClosed : T.dispersionTerm
  reactionTermClosed : T.reactionTerm
  transportEquationClosedClosed : T.transportEquationClosed

def GroundwaterTransportClosed (T : GroundwaterContaminantTransport) : Prop :=
  T.advectionTerm ∧ T.dispersionTerm ∧ T.reactionTerm ∧ T.transportEquationClosed

theorem groundwater_transport_closed_from_evidence (T : GroundwaterContaminantTransport) (E : GroundwaterTransportEvidence T) : GroundwaterTransportClosed T := by
  exact And.intro E.advectionTermClosed (And.intro E.dispersionTermClosed (And.intro E.reactionTermClosed E.transportEquationClosedClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse