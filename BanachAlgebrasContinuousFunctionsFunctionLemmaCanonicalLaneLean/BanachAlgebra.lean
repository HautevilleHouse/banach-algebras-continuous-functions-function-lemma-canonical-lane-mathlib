import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure BanachAlgebraPackage where
  carrier : Type u
  norm : carrier → ℝ
  mul : carrier → carrier → carrier
  one : carrier
  norm_mul : ∀ a b : carrier, norm (mul a b) ≤ norm a * norm b
  norm_one : norm one = 1
  completeness : Prop
  completeness_proof : completeness

structure BanachAlgebraEvidence (B : BanachAlgebraPackage) where
  completeness_closed : B.completeness

def BanachAlgebraClosed (B : BanachAlgebraPackage) : Prop :=
  B.completeness

theorem banach_algebra_closed_from_evidence (B : BanachAlgebraPackage) (E : BanachAlgebraEvidence B) :
    BanachAlgebraClosed B := by
  exact E.completeness_closed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse