import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.BanachAlgebraPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure SpectrumPackage (B : BanachAlgebra) where
  element : B.carrier
  spectrum : Set ℝ
  nonemptiness : spectrum.Nonempty
  compactness : CompactSpace (Subtype fun x => x ∈ spectrum)
  spectralRadiusFormula : Prop

structure SpectrumEvidence (B : BanachAlgebra) (S : SpectrumPackage B) where
  nonemptinessClosed : S.spectrum.Nonempty
  compactnessClosed : CompactSpace (Subtype fun x => x ∈ S.spectrum)
  spectralRadiusFormulaClosed : S.spectralRadiusFormula

def SpectrumClosed (B : BanachAlgebra) (S : SpectrumPackage B) : Prop :=
  S.spectrum.Nonempty ∧ CompactSpace (Subtype fun x => x ∈ S.spectrum) ∧ S.spectralRadiusFormula

theorem spectrum_closed_from_evidence (B : BanachAlgebra) (S : SpectrumPackage B) (E : SpectrumEvidence B S) :
    SpectrumClosed B S := by
  exact And.intro E.nonemptinessClosed (And.intro E.compactnessClosed E.spectralRadiusFormulaClosed)

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse