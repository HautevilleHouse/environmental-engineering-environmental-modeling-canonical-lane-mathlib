import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean.AdvectionDiffusionTransport
import HautevilleHouse.EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean.ContaminantReactiveTransport

/-!
# Surface Water Quality Model Package
-/

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure SurfaceWaterQualityModelPackage
    {P : AdvectionDiffusionTransportPackage}
    (C : ContaminantReactiveTransportPackage P) where
  eutrophicationDynamics : Type u
  sedimentTransport : Type v
  dissolvedOxygenBudget : Type w
  nutrientCycling : Prop
  algalBloomKinetics : Prop
  waterQualityStandardsCompliance : Prop

structure SurfaceWaterQualityModelEvidence
    {P : AdvectionDiffusionTransportPackage}
    {C : ContaminantReactiveTransportPackage P}
    (S : SurfaceWaterQualityModelPackage C) where
  nutrientCyclingClosed : S.nutrientCycling
  algalBloomKineticsClosed : S.algalBloomKinetics
  waterQualityStandardsComplianceClosed : S.waterQualityStandardsCompliance

def SurfaceWaterQualityModelClosed
    {P : AdvectionDiffusionTransportPackage}
    {C : ContaminantReactiveTransportPackage P}
    (S : SurfaceWaterQualityModelPackage C) : Prop :=
  S.nutrientCycling ∧ S.algalBloomKinetics ∧ S.waterQualityStandardsCompliance

theorem surface_water_quality_model_closed_from_evidence
    {P : AdvectionDiffusionTransportPackage}
    {C : ContaminantReactiveTransportPackage P}
    (S : SurfaceWaterQualityModelPackage C)
    (E : SurfaceWaterQualityModelEvidence S) :
    SurfaceWaterQualityModelClosed S := by
  exact And.intro E.nutrientCyclingClosed
    (And.intro E.algalBloomKineticsClosed E.waterQualityStandardsComplianceClosed)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse
