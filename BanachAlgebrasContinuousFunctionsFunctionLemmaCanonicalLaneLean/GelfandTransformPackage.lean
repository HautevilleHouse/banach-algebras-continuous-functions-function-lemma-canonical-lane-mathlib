import BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.ContinuousFunctionPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure GelfandTransformPackage (A : BanachAlgebraAdmittedObject) (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) where
  isIsomorphism : Prop
  preservesNorm : Prop
  surjective : Prop
  injective : Prop

structure GelfandTransformEvidence {A : BanachAlgebraAdmittedObject} {X : CompactHausdorffSpace} {C : ContinuousFunctionSpace X} (G : GelfandTransformPackage A X C) where
  isIsomorphismClosed : G.isIsomorphism
  preservesNormClosed : G.preservesNorm
  surjectiveClosed : G.surjective
  injectiveClosed : G.injective

def GelfandTransformClosed {A : BanachAlgebraAdmittedObject} {X : CompactHausdorffSpace} {C : ContinuousFunctionSpace X} (G : GelfandTransformPackage A X C) : Prop :=
  G.isIsomorphism ∧ G.preservesNorm ∧ G.surjective ∧ G.injective

theorem gelfand_transform_closed_from_evidence {A : BanachAlgebraAdmittedObject} {X : CompactHausdorffSpace} {C : ContinuousFunctionSpace X} (G : GelfandTransformPackage A X C) (E : GelfandTransformEvidence G) :
    GelfandTransformClosed G := by
  exact And.intro E.isIsomorphismClosed (And.intro E.preservesNormClosed (And.intro E.surjectiveClosed E.injectiveClosed))

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse