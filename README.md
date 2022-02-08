# EM622---3

Breast cancer is the most diagnosed cancer among American women. About 1 in 8 U.S. women will develop invasive breast cancer over the course of her lifetime. Wisconsin Diagnostic Breast Cancer (WDBC) dataset provides 286 samples of 9 variables related to breast cancer diagnosis:

i. age: age (in years at last birthday) of the patient at the time of diagnosis.
ii. menopause: whether the patient is pre- or post- menopausal at time of diagnosis.
iii. tumor.size: the greatest diameter (in mm) of the excised tumor.
iv. inv.nodes: the number (range 0 - 39) of axillary lymph nodes that contain metastatic breast cancer visible on histological examination.
v. node.caps: if the cancer does metastasize to a lymph node, although outside the original site of the tumor it may remain “contained” by the capsule of the lymph node. However, over time, and with more aggressive disease, the tumor may replace the lymph node and then penetrate the capsule, allowing it to invade the surrounding tissues.
vi. delig.malig: degree of malignancy as the histological grade (range 1-3) of the tumor – tumors that are grade 1 predominantly consist of cells that, while neoplastic, retain many of their usual characteristics; grade 3 tumors predominately consist of cells that are highly abnormal.
vii. breast: breast cancer may obviously occur in either breast.
viii. breast.quad: four quadrants of breast, using the nipple as a central point; ix.
ix. irradiat: if received radiation therapy as treatment that uses high-energy x-rays to destroy cancer
cells.

(1) Download “breast-cancer.csv”. Spend some time understanding the dataset and perform necessary data preparation.
See lines 23-33

(2) Is there a relationship between age group and malignancy for women who did not receive radiation therapy, and how does this relationship compare to women who did receive radiation therapy? I will align the average tumor size for each group to analyze if this is a factor in the decision.

(3) Manipulate the dataset and prepare for the visualization.
See lines 36-148

(4) The four plots I arranged in order vertically are:
1. Double bar chart showing age group on x axis, frequency malignant (1) and frequency abnormal (3) on y axis for non-radiation therapy group.
2. Line plot with age group on x axis, average tumor size on y axis for non-radiation therapy group.
3. Double bar chart showing age group on x axis, frequency malignant (1) and frequency abnormal (3) on y axis for radiation therapy group.
4. Line plot with age group on x axis, average tumor size on y axis for radiation therapy group.
This format makes it simple to see any relationship between age group and malignancy for women who did not receive radiation therapy compared to women who did receive radiation therapy


(5) Tune the appearance, such as color, size.
See lines 142-148, 151-153, 52-66

(6) Insights: It seems that the group of women who did not elect to go to radiation therapy had a higher frequency of malignant tumors, which logically makes sense. The group that did choose to go to radiation therapy had a higher frequency of abnormal tumors, which sheds light on their decision. The most interesting piece of information that this data manipulation and visualization produced was the fact that the average tumor size in both groups of women and across all age groups was identical at 27. I expected to see at least some difference among age groups and I was seeking to learn if there was a significant difference in size between malignant and abnormal tumors. There were very few women who chose to attend radiation therapy for malignant tumors, and the non-radiation therapy group was split almost evenly between malignant and abnormal tumors.



The Airbnb NYC data provides information such as host name, price, number of reviews. Download “AB_NYC_2019.csv” from Canvas and explore the dataset.
(1) What is a sample of Airbnb options for Brooklyn private rooms with more than 250 reviews? See lines 157-202

(2) How many Airbnb reviews are written in each neighborhood within Manhattan, Brooklyn, and Queens? Number of reviews is shown by size and total cumulative asking price is shown by color. See lines 205-213


