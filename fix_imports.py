import os

def fix_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Replace the relative core imports with package imports
    content = content.replace("import '../../../core/", "import 'package:abhishek_dev/core/")
    content = content.replace("import '../../../../core/", "import 'package:abhishek_dev/core/")
    content = content.replace("import '../widgets/", "import 'package:abhishek_dev/features/portfolio/presentation/widgets/")
    
    with open(filepath, 'w') as f:
        f.write(content)

for root, _, files in os.walk('lib'):
    for file in files:
        if file.endswith('.dart'):
            fix_file(os.path.join(root, file))

