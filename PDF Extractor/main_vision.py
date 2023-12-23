import cv2
import numpy as np
from PyPDF2 import PdfFileReader
from pdf2image import convert_from_path
import os
import glob


def find_horizontal_line(image):
    open_cv_image = np.array(image)
    img_gray = cv2.cvtColor(open_cv_image, cv2.COLOR_BGR2GRAY)

    edges = cv2.Canny(img_gray, 50, 150, apertureSize=3)
    lines = cv2.HoughLinesP(edges, 1, np.pi / 180, 100, minLineLength=0.8*img_gray.shape[1], maxLineGap=10)

    top_line_y = img_gray.shape[0]  # Initialize with the bottom of the image

    for line in lines:
        x1, y1, x2, y2 = line[0]
        if abs(y2 - y1) < 0.01:  # Check if the line is horizontal
            avg_y = (y1 + y2) / 2
            if avg_y < top_line_y and avg_y > 0.45 * img_gray.shape[0]:  # Check if the line is above the current top line and below 30% of the image height
                top_line_y = avg_y

    return top_line_y


def extract_images_v2(pdf_path, output_folder):
    os.makedirs(output_folder, exist_ok=True)
    pdf = PdfFileReader(pdf_path)
    num_pages = pdf.getNumPages()

    max_num = num_pages
    num_digits = len(str(max_num))

    pdfname = os.path.splitext(os.path.basename(pdf_path))[0]

    total_images = 0

    for i in range(num_pages):
        if i < 9:
            print(f"Looking for horizontal line in page 0{i+1}, file: {pdfname}")
        else:
            print(f"Looking for horizontal line in page {i+1}, file: {pdfname}")
        images = convert_from_path(pdf_path, first_page=i+1, last_page=i+1)
        for j, image in enumerate(images):
            top_line_y = find_horizontal_line(image)
            cropped_image = image.crop((0, 0, image.width, top_line_y))
            total_images += 1
            output_file = f"{pdfname}_{total_images:0{num_digits}d}.png"
            cropped_image.save(os.path.join(output_folder, output_file))
            print(f"Saved image {total_images} from page {i+1} as {output_file}")


def bulk_extract_images():
    pdf_files = glob.glob("input/*.pdf")
    for pdf_file in pdf_files:
        output_folder = os.path.join("output", os.path.splitext(os.path.basename(pdf_file))[0])
        extract_images_v2(pdf_file, output_folder)


bulk_extract_images()

