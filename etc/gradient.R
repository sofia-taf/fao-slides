n <- 2000
dark <- do.call(rgb, as.list(c(87, 146, 201) / 255))
mid  <- do.call(rgb, as.list(c(160, 215, 245) / 255))
pdf("gradient.pdf", width=30, height=3)
par(plt=c(0,1,0,1))
barplot(rep(1,n), col=colorRampPalette(c(dark, mid, "white"))(n),
        space=-0.5, border=FALSE, axes=FALSE)
dev.off()
system("pdfsize gradient.pdf")

# We start with a PDF file that is 2160 x 216 pts

system("pcrop gradient.pdf 2:107 216:2000")
system("out gradient")
system("pdfsize gradient.pdf")

# After cropping, the PDF is 1893 x 214 pts
# To create a high-quality bitmap PNG file, we aim for 3786 x 428 pixels

system("2png -d144 gradient.pdf")
system("img gradient.png")

# First PNG is 4320 x 432 px

system("mogrify -crop 3786x428+214+0 gradient.png")

# After cropping, the PNG is 3786 x 428 px

system("optipng gradient.png")
