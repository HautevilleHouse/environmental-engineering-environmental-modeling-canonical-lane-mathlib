import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure ClimateEnergyBalanceModel where
  radiativeForcing : Type u
  albedoEffect : Type v
  heatCapacity : Type w
  energyBalanceEquation : Prop
  greenhouseGasConcentrations : Prop
  temperatureResponse : Prop

structure ClimateEnergyEvidence (C : ClimateEnergyBalanceModel) where
  energyBalanceEquationClosed : C.energyBalanceEquation
  greenhouseGasConcentrationsClosed : C.greenhouseGasConcentrations
  temperatureResponseClosed : C.temperatureResponse

def ClimateEnergyClosed (C : ClimateEnergyBalanceModel) : Prop :=
  C.energyBalanceEquation ∧ C.greenhouseGasConcentrations ∧ C.temperatureResponse

theorem climate_energy_closed_from_evidence (C : ClimateEnergyBalanceModel) (E : ClimateEnergyEvidence C) : ClimateEnergyClosed C := by
  exact And.intro E.energyBalanceEquationClosed (And.intro E.greenhouseGasConcentrationsClosed E.temperatureResponseClosed)

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse