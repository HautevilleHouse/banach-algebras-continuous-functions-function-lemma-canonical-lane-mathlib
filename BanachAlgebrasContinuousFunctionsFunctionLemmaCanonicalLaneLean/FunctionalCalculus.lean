import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure Spectrum {B : BanachAlgebraPackage} (a : B.carrier) where
  values : Set ℝ
  compact : Prop

structure ContinuousFunctionalCalculusPackage {B : BanachAlgebraPackage}
    (a : B.carrier) (sp : Spectrum a) where
  calculus : {f : ℝ → ℝ | Continuous f} → B.carrier
  homomorphism : ∀ f g, calculus f * calculus g = calculus (f * g)
  spectralMapping : ∀ f, Spectrum (calculus f) = f '' sp.values

structure ContinuousFunctionalCalculusEvidence {B : BanachAlgebraPackage}
    {a : B.carrier} {sp : Spectrum a}
    (F : ContinuousFunctionalCalculusPackage a sp) where
  homomorphismClosed : ∀ f g, F.calculus f * F.calculus g = F.calculus (f * g)
  spectralMappingClosed : ∀ f, Spectrum (F.calculus f) = f '' sp.values

def ContinuousFunctionalCalculusClosed {B : BanachAlgebraPackage}
    {a : B.carrier} {sp : Spectrum a}
    (F : ContinuousFunctionalCalculusPackage a sp) : Prop :=
  (∀ f g, F.calculus f * F.calculus g = F.calculus (f * g)) ∧
  (∀ f, Spectrum (F.calculus f) = f '' sp.values)

theorem continuous_functional_calculus_closed_from_evidence
    {B : BanachAlgebraPackage} {a : B.carrier} {sp : Spectrum a}
    (F : ContinuousFunctionalCalculusPackage a sp)
    (E : ContinuousFunctionalCalculusEvidence F) :
    ContinuousFunctionalCalculusClosed F :=
  And.intro E.homomorphismClosed E.spectralMappingClosed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse