# Gemma 4 12B Instruct (QAT, Q4_0) — GGUF

This repository contains the **`gemma-4-12b-it-qat-q4_0.gguf`** model file, split into
74 parts of ≤ 90 MB each to fit within GitHub's 100 MB per-file limit.

- **Model:** `gemma-4-12b-it-qat-q4_0.gguf`
- **Size (original):** 6.5 GiB (6,975,879,296 bytes)
- **Quantization:** Q4_0 (QAT)
- **SHA-256:** `93567e57a8fe10b23569b9d9ec38cd005deedf71e29477c421a4b83f418a538b`

## Download & Reassemble

### Option 1 — Script (Linux/macOS)

```bash
git clone https://github.com/Arp1tMoga/gemma-4-12b-it-qat-q4_0.git
cd gemma-4-12b-it-qat-q4_0
chmod +x merge_model.sh
./merge_model.sh
```

### Option 2 — Manual

```bash
git clone https://github.com/Arp1tMoga/gemma-4-12b-it-qat-q4_0.git
cd gemma-4-12b-it-qat-q4_0
cat model_chunks/gemma-4-12b-it-qat-q4_0.gguf.part-* > gemma-4-12b-it-qat-q4_0.gguf
sha256sum -c gemma-4-12b-it-qat-q4_0.gguf.sha256
```

The merged file is a standard GGUF and can be used with llama.cpp / Ollama /
LM Studio directly.

## License

The underlying model is released by Google under the
[Gemma Terms of Use](https://ai.google.dev/gemma/terms). Check those terms before
redistributing or using commercially.
