import BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.BanachAlgebraObjects

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : BanachAlgebraAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.functionLemmaConclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse