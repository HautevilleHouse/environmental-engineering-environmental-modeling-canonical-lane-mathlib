import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean.AdvectionDiffusionTransport

/-!
# Contaminant Reactive Transport Package
-/

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure ContaminantReactiveTransportPackage
    {P : AdvectionDiffusionTransportPackage} where
  reactionNetwork : Type u
  equilibriumIsotherm : Type v
  biodegradationKinetics : Type w
  retardationFactor : Prop
  reactionStoichiometry : Prop
  sourceTermCoupling : Prop

structure ContaminantReactiveTransportEvidence
    {P : AdvectionDiffusionTransportPackage}
    (C : ContaminantReactiveTransportPackage P) where
  retardationFactorClosed : C.retardationFactor
  reactionStoichiometryClosed : C.reactionStoichiometry
  sourceTermCouplingClosed : C.sourceTermCoupling

def ContaminantReactiveTransportClosed
    {P : AdvectionDiffusionTransportPackage}
    (C : ContaminantReactiveTransportPackage P) : Prop :=
  C.retardationFactor ∧ C.reactionStoichiometry ∧ C.sourceTermCoupling

theorem contaminant_reactive_transport_closed_from_evidence
    {P : AdvectionDiffusionTransportPackage}
    (C : ContaminantReactiveTransportPackage P)
    (E : ContaminantReactiveTransportEvidence C) :
    ContaminantReactiveTransportClosed C := by
  exact And.intro E.retardationFactorClosed
    (And.intro E.reactionStoichiometryClosed E.sourceTermCouplingClosed)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse
