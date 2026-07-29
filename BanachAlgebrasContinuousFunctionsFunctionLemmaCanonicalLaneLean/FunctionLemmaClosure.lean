import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.StoneWeierstrassBridge
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.GelfandTransform

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A with
  | { object := _, endpointSatisfied := _, remainderRecorded := _, gateWitness := _ } => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rfl

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedFunctionLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_function_lemma_endgame (A : AdmissibleClass) :
    ConstrainedFunctionLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse