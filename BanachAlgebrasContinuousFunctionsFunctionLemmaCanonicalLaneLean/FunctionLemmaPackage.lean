import BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.GelfandTransformPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure FunctionLemmaPackage (A : BanachAlgebraAdmittedObject) (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) (G : GelfandTransformPackage A X C) where
  statement : Prop
  proof : statement
  bridgesToGelfand : G.isIsomorphism → statement

structure FunctionLemmaEvidence (F : FunctionLemmaPackage A X C G) where
  statementClosed : F.statement
  bridgesToGelfandClosed : F.bridgesToGelfand (by exact ?_) -- need to fill

def FunctionLemmaClosed (F : FunctionLemmaPackage A X C G) : Prop :=
  F.statement

theorem function_lemma_closed_from_evidence (F : FunctionLemmaPackage A X C G) (E : FunctionLemmaEvidence F) :
    FunctionLemmaClosed F := by
  exact E.statementClosed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse