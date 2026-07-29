import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure ReactiveTransportPackage where
  transportMechanisms : Prop
  reactionKinetics : Prop
  couplingDegree : Prop
  biocloggingEffect : Prop

structure ReactiveTransportEvidence (R : ReactiveTransportPackage) where
  transportMechanismsClosed : R.transportMechanisms
  reactionKineticsClosed : R.reactionKinetics
  couplingDegreeClosed : R.couplingDegree
  biocloggingEffectClosed : R.biocloggingEffect

def ReactiveTransportClosed (R : ReactiveTransportPackage) : Prop :=
  R.transportMechanisms ∧ R.reactionKinetics ∧ R.couplingDegree ∧ R.biocloggingEffect

theorem reactive_transport_closed_from_evidence
    (R : ReactiveTransportPackage) (E : ReactiveTransportEvidence R) :
    ReactiveTransportClosed R := by
  exact And.intro E.transportMechanismsClosed
    (And.intro E.reactionKineticsClosed
      (And.intro E.couplingDegreeClosed E.biocloggingEffectClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse