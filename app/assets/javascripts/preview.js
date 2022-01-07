document.addEventListener("DOMContentLoaded", () => {
  if (
    document.URL.match("posts/:id/edit$") ||
    document.URL.match("posts$") ||
    document.URL.match("users/edit$")
  ) {
    document
      .getElementById("image_upload")
      .addEventListener("change", function (e) {
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        const imageContent = document.getElementById("image_preview");
        if (imageContent) {
          imageContent.setAttribute("src", blob);
        } else {
          const ImagePreview = document.getElementById("preview_area");
          const blobImage = document.createElement("img");
          blobImage.setAttribute("id", "image_preview");
          blobImage.setAttribute("class", "preview");
          blobImage.setAttribute("src", blob);
          ImagePreview.appendChild(blobImage);
        }
      });
  }
});
