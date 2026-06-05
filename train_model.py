"""
Train a simple Iris classifier and save it as a .pkl file.
Run this once before starting the API: python train_model.py
"""
import os
import joblib
import numpy as np
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report, accuracy_score

def train():
    print("📦 Loading Iris dataset...")
    iris = load_iris()
    X, y = iris.data, iris.target

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42, stratify=y
    )

    print("🏋️  Training RandomForest classifier...")
    clf = RandomForestClassifier(n_estimators=100, random_state=42)
    clf.fit(X_train, y_train)

    y_pred = clf.predict(X_test)
    acc = accuracy_score(y_test, y_pred)
    print(f"\n✅ Accuracy: {acc * 100:.2f}%")
    print("\n📊 Classification Report:")
    print(classification_report(y_test, y_pred, target_names=iris.target_names))

    os.makedirs("model", exist_ok=True)
    model_path = "model/iris_model.pkl"
    joblib.dump(clf, model_path)
    print(f"💾 Model saved to {model_path}")

if __name__ == "__main__":
    train()
