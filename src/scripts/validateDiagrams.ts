/**
 * Database Diagram Validation Script
 * 
 * Usage:
 * 1. Run this script to validate all diagram_data in the questions table
 * 2. It will fetch all questions with diagrams from Supabase
 * 3. Validate each diagram using the diagramValidator utility
 * 4. Output a report of invalid/problematic diagrams
 * 
 * Run with: npx tsx src/scripts/validateDiagrams.ts
 * (Requires tsx: npm install -D tsx)
 */

import { createClient } from '@supabase/supabase-js';
import { validateDiagram, batchValidateDiagrams, formatValidationResult } from '../utils/diagramValidator';

// Supabase client setup
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  console.error('❌ Missing Supabase environment variables');
  console.error('Please ensure NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY are set');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseAnonKey);

async function validateAllDiagrams() {
  console.log('🔍 Fetching questions with diagrams from database...\n');

  // Fetch all questions that have diagram_data
  const { data: questions, error } = await supabase
    .from('questions')
    .select('id, question_text, diagram_data, strand, topic')
    .not('diagram_data', 'is', null);

  if (error) {
    console.error('❌ Error fetching questions:', error);
    process.exit(1);
  }

  if (!questions || questions.length === 0) {
    console.log('No questions with diagrams found.');
    return;
  }

  console.log(`Found ${questions.length} questions with diagrams\n`);
  console.log('━'.repeat(80));
  console.log('\n');

  // Validate all diagrams
  const diagramsToValidate = questions.map(q => ({
    id: q.id,
    data: q.diagram_data,
    metadata: {
      question_text: q.question_text,
      strand: q.strand,
      topic: q.topic
    }
  }));

  const batchResults = batchValidateDiagrams(diagramsToValidate);

  // Print summary
  console.log('📊 VALIDATION SUMMARY');
  console.log('━'.repeat(80));
  console.log(`Total diagrams:     ${batchResults.totalCount}`);
  console.log(`Valid diagrams:     ${batchResults.validCount} ✓`);
  console.log(`Invalid diagrams:   ${batchResults.invalidCount} ✗`);
  console.log(`Warnings:           ${batchResults.warningCount} ⚠`);
  console.log('━'.repeat(80));
  console.log('\n');

  // Print invalid diagrams
  const invalidResults = batchResults.results.filter(r => !r.result.valid);
  
  if (invalidResults.length > 0) {
    console.log('❌ INVALID DIAGRAMS:');
    console.log('━'.repeat(80));
    
    invalidResults.forEach(({ id, result }) => {
      const question = questions.find(q => q.id === id);
      console.log(`\nQuestion ID: ${id}`);
      console.log(`Strand: ${question?.strand || 'N/A'}`);
      console.log(`Topic: ${question?.topic || 'N/A'}`);
      console.log(`Question: ${question?.question_text.substring(0, 60)}...`);
      console.log(`Diagram Type: ${question?.diagram_data?.type || 'unknown'}`);
      console.log(formatValidationResult(result));
      console.log('─'.repeat(80));
    });
  } else {
    console.log('✅ All diagrams are valid!');
  }

  // Print warnings
  const warningResults = batchResults.results.filter(r => r.result.warnings.length > 0);
  
  if (warningResults.length > 0) {
    console.log('\n⚠️  DIAGRAMS WITH WARNINGS:');
    console.log('━'.repeat(80));
    
    warningResults.forEach(({ id, result }) => {
      const question = questions.find(q => q.id === id);
      console.log(`\nQuestion ID: ${id}`);
      console.log(`Question: ${question?.question_text.substring(0, 60)}...`);
      console.log(`Diagram Type: ${question?.diagram_data?.type || 'unknown'}`);
      result.warnings.forEach(warning => console.log(`  ⚠ ${warning}`));
    });
    console.log('━'.repeat(80));
  }

  // Exit with error code if any diagrams are invalid
  if (invalidResults.length > 0) {
    console.log('\n❌ Validation failed. Please fix invalid diagrams before generating more questions.');
    process.exit(1);
  } else {
    console.log('\n✅ All diagrams validated successfully!');
    process.exit(0);
  }
}

// Run the validation
validateAllDiagrams().catch(error => {
  console.error('❌ Unexpected error:', error);
  process.exit(1);
});
