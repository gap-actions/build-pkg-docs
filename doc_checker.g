Read("PackageInfo.g");
doc_infos := GAPInfo.PackageInfoCurrent.PackageDoc;
filenames := [ "HTMLStart", "SixFile" ${{ inputs.use-latex == 'true' && ', "PDFFile"' || ''  }}];

if IsRecord(doc_infos) then
  doc_infos := [doc_infos];
fi;

for doc_info in doc_infos do
  for filename in filenames do
    if not IsExistingFile( doc_info.(filename) ) then
      Error(
        Concatenation(
          "The documentation has supposedly been built, but the file ",
          doc_info.(filename),
          " specified in PackageDoc.",
          filename,
          " does not exist."
        )
      );
    fi;
  od;
od;
